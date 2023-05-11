import sqlite3 as sql
import time

print("\n| Добро пожаловать в экстрадолговечную базу!\n\n1 - Добавление\n2 - Список\n3 - Протокол [чистый лист]\n4 - Точное время вселенной\n5 - Тест 1")
choice = int(input("> "))
con = sql.connect('milky.db')
with con:
    cur = con.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS `milky` (`name` STRING, `surname` STRING, `old` STRING)")

    if choice == 1:
        name = input("Введите имя:\n> ")
        surname = input("Введите фамилию:\n> ")
        old = input("Введите возраст:\n>")
        cur.execute(f"INSERT INTO `milky` VALUES ('{name}', '{surname}', '{old}')")
    elif choice == 2:
        print("| Список базы:\n")
        cur.execute("SELECT * FROM `milky`")
        rows = cur.fetchall()
        for row in rows:
            print(row[0], row[1])
    elif choice == 3:
        print("| Протокол [чистый лист] активирован!\n")
        cur.execute("DELETE FROM milky")
        print("| Данные успешно очищены!")
    elif choice == 4:
        t = time.localtime(time.time())
        localtime = time.asctime(t)
        totaltime = "| Точное время: " + time.asctime(t)
        print(totaltime);
    elif choice == 5:
        print("| Тест 1!")
    else:
        print("| Такой команды не существует!")

    con.commit()
    cur.close()
