from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView

class RegisterView(APIView):
    def get(self, request):
        return Response({"message": "Use POST to register"}, status=status.HTTP_400_BAD_REQUEST)

    def post(self, request):
        # Your registration logic here
        return Response({"message": "User registered successfully"}, status=status.HTTP_201_CREATED)
