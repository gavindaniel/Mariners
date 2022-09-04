class Article(object):
    def __init__(self, title, date, author, source, body):
        self.title = title
        self.date = date
        self.author = author
        self.source = source
        self.body = body

    # @staticmethod
    # def from_dict(source):
    #     # ...

    # def to_dict(self):
    #     # ...

    def __repr__(self):
        return (
            f'Article(\
                title={self.title}, \
                date={self.date}, \
                author={self.author}, \
                source={self.source}, \
                body={self.body}\
            )'
        )