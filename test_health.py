#!/usr/bin/env python3
"""
Test script untuk debug health check
"""
import requests
import time
import os

def test_health():
    """Test health endpoint"""
    port = os.environ.get('PORT', 5000)
    url = f"http://localhost:{port}/api/v1/health"
    
    print(f"Testing health endpoint: {url}")
    
    try:
        response = requests.get(url, timeout=10)
        print(f"Status: {response.status_code}")
        print(f"Response: {response.text}")
        return response.status_code == 200
    except Exception as e:
        print(f"Error: {e}")
        return False

def test_root():
    """Test root endpoint"""
    port = os.environ.get('PORT', 5000)
    url = f"http://localhost:{port}/"
    
    print(f"Testing root endpoint: {url}")
    
    try:
        response = requests.get(url, timeout=10)
        print(f"Status: {response.status_code}")
        print(f"Response: {response.text}")
        return response.status_code == 200
    except Exception as e:
        print(f"Error: {e}")
        return False

if __name__ == "__main__":
    print("🧪 Testing API endpoints...")
    
    # Wait for app to start
    print("Waiting 5 seconds for app to start...")
    time.sleep(5)
    
    # Test endpoints
    health_ok = test_health()
    root_ok = test_root()
    
    print(f"\n📊 Test Results:")
    print(f"Health endpoint: {'✅' if health_ok else '❌'}")
    print(f"Root endpoint: {'✅' if root_ok else '❌'}")
    
    if health_ok and root_ok:
        print("🎉 All tests passed!")
        exit(0)
    else:
        print("❌ Some tests failed!")
        exit(1) 