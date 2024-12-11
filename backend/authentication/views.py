# authentication/views.py

from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import UserSerializer
from django.views.decorators.csrf import csrf_exempt

# Sign up view
@csrf_exempt
def signup(request):
    if request.method == 'POST':
        print("aayo")
        form = UserCreationForm(request.POST)
        if form.is_valid():
            print ("bhayo")
            form.save()
            messages.success(request, 'Your account has been created successfully!')
            return redirect('login')  # Redirect to login page after successful signup
        else:
            messages.error(request, 'There was an error creating your account')
    else:
        form = UserCreationForm()
    return render(request, 'authentication/signup.html', {'form': form})

# Login view
def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, 'You are now logged in!')
            return redirect('home')  # Redirect to home or dashboard after successful login
        else:
            messages.error(request, 'Invalid username or password')
    return render(request, 'authentication/login.html')

# Logout view
def logout_view(request):
    logout(request)
    return redirect('login')  # Redirect to login page after logging out

# Django REST API signup view (API-based)
class RegisterUserView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "User created successfully!"}, status=status.HTTP_201_CREATED)
        print (serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    







    from django.http import JsonResponse
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password
from django.views.decorators.csrf import csrf_exempt
import json

@csrf_exempt
def signup(request):
    if request.method == 'POST':
        try:
            # Parse the JSON request body
            data = json.loads(request.body)

            # Extract required fields
            username = data.get('username')
            password = data.get('password')

            if not username or not password:
                return JsonResponse({'error': 'Username and password are required.'}, status=400)

            # Check if the username already exists
            if User.objects.filter(username=username).exists():
                return JsonResponse({'error': 'Username already exists.'}, status=400)

            # Create the user
            user = User.objects.create(
                username=username,
                password=make_password(password)  # Hash the password before saving
            )
            user.save()

            return JsonResponse({'message': 'User created successfully!'}, status=201)

        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON data.'}, status=400)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Invalid HTTP method. Only POST is allowed.'}, status=405)
