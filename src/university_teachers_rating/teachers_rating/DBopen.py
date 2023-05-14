import psycopg2


class DatabaseOpen():
    def __init__(self):
        self.conn = psycopg2.connect(
            host="localhost",
            port="54321",
            database="Professors_views",
            user="postgres",
            password="7850576"
        )

        self.curs = self.conn.cursor()

    def request(self, req):
        res = self.curs.execute(req).fetchall()
        self.curs.close()
        self.curs = self.conn.cursor()

        return res.fetchall()
