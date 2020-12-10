from django.contrib.auth.models import User
from django.db import models


class Author(models.Model):
    username = models.OneToOneField(User, on_delete=models.CASCADE)
    rating = models.IntegerField(default=1, )

    @property
    def rating(self, value):
        self._rating = value
        return self.rating
    def update_rating(self):
        self._rating = 3 * Post.get_rate




class Category(models.Model):
    sport = 'SP'
    politics = 'PO'
    education = 'ED'
    themes = [
        (sport, "Спорт"),
        (politics, "Политика"),
        (education, "Образование")
    ]
    theme = models.CharField(max_length=2,
                             choices=themes,
                             default=education,
                             unique=True)


class Post(models.Model):
    article = 'AR'
    news = 'NE'
    selections = [
        (article, 'Статья'),
        (news, 'Новость')
    ]
    selection_box = models.CharField(max_length=2,
                                     choices=selections,
                                     default=news)
    auto_time = models.DateTimeField(auto_now_add=True)
    heading = models.CharField(max_length=124)
    post_text = models.CharField(max_length=124)
    rating = models.IntegerField(default=0)

    @property
    def rating(self, value):
        self._rating = value

    @rating.setter
    def like(self):
        self._rating += 1

    @rating.setter
    def dislike(self):
        self._rating -= 1

    @rating.getter
    def get_rate(self):
        return self.rating

    def preview(self):
        return self.post_text[:125]


class PostCategory(models.Model):
    username = models.ForeignKey(Post, on_delete=models.CASCADE)
    theme = models.ForeignKey(Category, on_delete=models.CASCADE)


class Comment(models.Model):
    article_text = models.TextField()
    auto_time = models.DateTimeField(auto_now_add=True)
    rating = models.IntegerField(default=0)
    username = models.ForeignKey(Post, on_delete=models.CASCADE)
    another_name = models.ForeignKey(User, on_delete=models.CASCADE)

    @property
    def rating(self, value):
        self._rating = value
        return self.rating

    @rating.setter
    def like(self):
        self._rating += 1

    @rating.setter
    def dislike(self):
        self._rating -= 1

# Create your models here.
