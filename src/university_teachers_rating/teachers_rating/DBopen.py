import psycopg2


class DBopen():
    def __init__(self):
        self.conn = psycopg2.connect(
            host="localhost",
            port="54321",
            database="Professors_views",
            user="postgres",
            password="7850576"
        )

        self.cursor = self.conn.cursor()

    def request(self, req):
        res = self.cursor.execute('SELECT fio FROM professors_data')

        self.cursor.close()
        self.cursor = self.conn.cursor()

        return res
