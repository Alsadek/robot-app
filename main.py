import recognition
import detectencode
#import gtts
import mysql.connector
import time


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="P@ssw0rd",
  database="smartmcc"
)
mycursor = mydb.cursor()
doctorId = '2'                       # should be fixed for every doctor


def check_reservation(userID):
    sql = "SELECT * FROM user_reservation WHERE user_id = %s AND doctor_id = %s"
    mycursor.execute(sql, (userID, doctorId))
    reco = mycursor.fetchall()
    return reco


def available_dates():
    sql = "SELECT * FROM available_dates WHERE doctor_id = %s"
    mycursor.execute(sql, (doctorId,))
    dates = mycursor.fetchall()
    return dates


def new_reservation(userID, date, time):
    sql = "INSERT INTO user_reservation (user_id, doctor_id, date, time) VALUES (%s,%s, %s, %s)"
    val = (userID, doctorId, date, time)
    mycursor.execute(sql, val)
    mydb.commit()
    delete_available(date, time)


def delete_available(date, time):
    sql = "DELETE FROM available_dates WHERE doctor_id = %s AND date = %s AND time = %s"
    mycursor.execute(sql, (doctorId, date, time))
    mydb.commit()


def get_userID_byphone(phone):
    sql = "SELECT * FROM userinfo WHERE mobile = %s"
    mycursor.execute(sql, (phone,))
    ph = mycursor.fetchone()
    return ph


ex = input("What you want to do? ")
while ex != '0':

    if ex == '1':
        ret = recognition.start()
        print(ret)
        if ret == "Unknown":
            phone = input("Pleas Enter Your phone number : ")

            try:
                # Search this phone number over db to find if he set appointment
                sql = "SELECT * FROM userinfo WHERE mobile = %s"
                mycursor.execute(sql, (phone,))
                record = mycursor.fetchall()
                # print(len(record))
                if len(record) == 0:                    # Not registered on system
                    print("No Records For this number")
                    fname = input("Pleas Enter Your First Name : ")
                    lname = input("Pleas Enter Your Last Name : ")
                    ask = input("Do you want to register in our system? : ")
                    if ask == "yes":
                        # insert essential data to db and give password
                        sql = "INSERT INTO userinfo (fName, lName, mobile, password) VALUES (%s,%s, %s, %s)"
                        val = (fname, lname, phone, "123456")
                        mycursor.execute(sql, val)

                        mydb.commit()
                        detectencode.start(phone)

                        print("Your Default Password 123456 please change it")      # maybe create random password

                        dates = available_dates()
                        for idx, row in enumerate(dates):
                            print(idx + 1, "- Date = ", row[2])
                            print("Time  = ", row[3], "\n")

                        choose_date = input("Please Choose Your Preferred Date : ")
                        intch = int(choose_date)
                        new_reservation(user_id, dates[intch - 1][2], dates[intch - 1][3])

                        print("Cash Acceptor")

                    else:
                        print("Cash Acceptor, if return 1 redirect to current users")

                # registered on system but his face unknown
                else:
                    for row in record:
                        print("Id = ", row[0], )
                        print("Name = ", row[1], row[2])
                        print("Gender  = ", row[3], "\n")
                    ask = input("Do you want to save your face in our system? : ")
                    if ask == "yes":
                        detectencode.start(phone)

                    # Return empty array if no reservation, or return reservation information if reserved
                    user_id = record[0][0]
                    reservation = check_reservation(user_id)
                    if len(reservation) > 0:                    # user reserved date in db
                        payment = reservation[0][5]             # Payment Status (0 or 1)

                        if payment == '1':
                            print("Current Users")

                        else:
                            print("Cash Acceptor")

                    else:
                        dates = available_dates()
                        for idx, row in enumerate(dates):
                            print(idx+1, "- Date = ", row[2])
                            print("Time  = ", row[3], "\n")

                        choose_date = input("Please Choose Your Preferred Date : ")
                        intch = int(choose_date)
                        new_reservation(user_id, dates[intch-1][2], dates[intch-1][3])
                        print("Redirect to cash acceptor")
                        print("Current Users")

            except mysql.connector.Error as error:
                print("Failed to get record from database: {}".format(error))

        elif ret == "":
            pass

        else:
            user_id = get_userID_byphone(ret)
            reservation = check_reservation(user_id[0])
            if len(reservation) > 0:            # user reserved date in db
                payment = reservation[0][5]     # Payment Status (0 or 1)

                if payment == '1':
                    print("Current Users")

                else:
                    print("Cash Acceptor")

            else:
                dates = available_dates()
                for idx, row in enumerate(dates):
                    print(idx + 1, "- Date = ", row[2])
                    print("Time  = ", row[3], "\n")

                choose_date = input("Please Choose Your Preferred Date : ")
                intch = int(choose_date)
                new_reservation(user_id, dates[intch - 1][2], dates[intch - 1][3])
                print("Redirect to cash acceptor")
                print("Current Users")

    time.sleep(10)                       # program will catch a picture every 10 seconds
    ex = input("What you want to do? ")  # this will be removed it in production
    if ex == '0':
        mycursor.close()
