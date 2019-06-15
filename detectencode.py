# import the necessary packages
from imutils.video import VideoStream
from imutils import paths
from imutils.video import FPS
import face_recognition
import argparse
import imutils
import pickle
import time
import cv2
import os

cwd = os.getcwd()

cascade = cwd+"/haarcascade_frontalface_default.xml"
encodin = cwd+"/encodings.pickle"

def start(newname):

    output = cwd + "/dataset/" + newname

    if not os.path.exists(output):
        os.makedirs(output)

    # load OpenCV's Haar cascade for face detection.
    detector = cv2.CascadeClassifier(cascade)

    # initialize the video stream, allow the camera sensor to warm up,
    # and initialize the total number of example faces written to disk
    # thus far
    print("[INFO] starting video stream...")
    vs = VideoStream(src=0).start()
    # vs = VideoStream(usePiCamera=True).start()
    time.sleep(2.0)
    total = 0

    # loop over the frames from the video stream
    while True:

        frame = vs.read()
        orig = frame.copy()
        frame = imutils.resize(frame, width=400)

        # detect faces in the grayscale frame
        rects = detector.detectMultiScale(
            cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY), scaleFactor=1.1,
            minNeighbors=5, minSize=(30, 30))

        # loop over the face detections and draw them on the frame
        for (x, y, w, h) in rects:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)

        # show the output frame
        cv2.imshow("Frame", frame)
        key = cv2.waitKey(1) & 0xFF

        # write the original frame to disk.
        ts = os.path.sep.join([output, "{}.png".format(str(total).zfill(5))])
        cv2.imwrite(ts, orig)
        total += 1
        if (total == 50):
            break

        if key == ord("k"):
            p = os.path.sep.join([output, "{}.png".format(
                str(total).zfill(5))])
            cv2.imwrite(p, orig)
            total += 1

        # if the `q` key was pressed, break from the loop
        elif key == ord("q"):
            break

    # do a bit of cleanup
    print("[INFO] {} face images stored".format(total))
    print("[INFO] cleaning up...")
    cv2.destroyAllWindows()
    vs.stop()

    # grab the paths to the input images in our dataset
    print("[INFO] quantifying faces...")
    imagePaths = list(paths.list_images(output))

    # initialize the list of known encodings and known names
    knownEncodings = []
    knownNames = []

    # loop over the image paths
    for (i, imagePath) in enumerate(imagePaths):
        # extract the person name from the image path
        print("[INFO] processing image {}/{}".format(i + 1,
                                                     len(imagePaths)))
        name = imagePath.split(os.path.sep)[-2]

        image = cv2.imread(imagePath)
        rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

        boxes = face_recognition.face_locations(rgb, model="hog")

        # compute the facial embedding for the face
        encodings = face_recognition.face_encodings(rgb, boxes)

        # loop over the encodings
        for encoding in encodings:
            knownEncodings.append(encoding)
            knownNames.append(name)

    # dump the facial encodings + names to disk
    print("[INFO] serializing encodings...")
    data = {"encodings": knownEncodings, "names": knownNames}
    exists = os.path.isfile(encodin)
    if exists:
        old_data = pickle.loads(open(encodin, "rb").read())
        for Oldencoding in old_data['encodings']:
            data['encodings'].append(Oldencoding)
        for Oldname in old_data['names'] :
            data['names'].append(Oldname)
    f = open(encodin, "wb")
    f.write(pickle.dumps(data))
    f.close()
