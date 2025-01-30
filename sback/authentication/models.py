from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    # Add or modify your fields here if needed
    groups = models.ManyToManyField(
        'auth.Group',
        related_name='authentication_user_set',  # Specify a unique related name
        blank=True,
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        related_name='authentication_user_permissions',  # Specify a unique related name
        blank=True,
    )
