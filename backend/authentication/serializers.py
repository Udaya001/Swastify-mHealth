from django.contrib.auth.models import User
from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    confirmPassword = serializers.CharField(write_only=True)
    class Meta:
        model = User
        fields = ['username', 'email','password', 'confirmPassword' ]

        # extra_kwargs = {
        #     'password': {'write_only': True}  # Don't expose password in responses
        # }

    def validate(self, data):
        # Ensure that password and confirm_password match
        if data['password'] != data['confirmPassword']:
            raise serializers.ValidationError({"confirmPassword": "Passwords must match."})
        return data
    
    def create(self, validated_data):
        # Remove the confirm_password field before creating the user
        validated_data.pop('confirmPassword')
        user = User.objects.create_user(**validated_data)
        return user
            
    
        
