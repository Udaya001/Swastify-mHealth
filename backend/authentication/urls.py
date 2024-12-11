# authentication/urls.py
from django.urls import path
from . import views
from .views import RegisterUserView  # Import the RegisterUserView for the API

urlpatterns = [
    # Regular views for rendering signup/login/logout forms
    path('signup/', views.signup, name='signup'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    
    # API endpoint for user registration (should have a different URL path to avoid conflict)
    path('signup_api/', RegisterUserView.as_view(), name='signup_api'),  # API endpoint for user registration
    
]