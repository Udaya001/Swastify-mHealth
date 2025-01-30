from django.http import JsonResponse
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import csrf_exempt
import json

@csrf_exempt
def register_view(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            username = data.get('username')
            email = data.get('email')
            password = data.get('password')

            if not username or not email or not password:
                return JsonResponse({'message': 'All fields (username, email, password) are required.'}, status=400)

            # Implement user creation logic (for example, using Django's User model)
            from django.contrib.auth.models import User
            user = User.objects.create_user(username=username, email=email, password=password)

            return JsonResponse({'message': 'User registered successfully!'}, status=200)
        except Exception as e:
            return JsonResponse({'message': f'Error: {str(e)}'}, status=400)
    else:
        return JsonResponse({'message': 'Invalid request method'}, status=405)

@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            username = data.get('username')
            password = data.get('password')

            if not username or not password:
                return JsonResponse({'message': 'Username and password are required.'}, status=400)

            # Authenticate the user
            user = authenticate(request, username=username, password=password)

            if user is not None:
                # If authentication is successful, log the user in
                login(request, user)
                return JsonResponse({'message': 'Login successful!'}, status=200)
            else:
                # If authentication fails, return an error
                return JsonResponse({'message': 'Invalid username or password.'}, status=400)

        except json.JSONDecodeError:
            return JsonResponse({'message': 'Invalid JSON format.'}, status=400)
        except Exception as e:
            # General error handling
            return JsonResponse({'message': f'Error: {str(e)}'}, status=500)

    else:
        # If the request method is not POST, return a method not allowed error
        return JsonResponse({'message': 'Invalid request method. Only POST requests are allowed.'}, status=405)
