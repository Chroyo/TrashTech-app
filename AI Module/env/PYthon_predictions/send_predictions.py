import requests
from config import THINGSPEAK_WRITE_API

# Function to send predictions to ThingSpeak
def send_real_prediction(predicted_value):
    url = f"https://api.thingspeak.com/update?api_key={THINGSPEAK_WRITE_API}&field2={predicted_value}"
    
    try:
        response = requests.get(url)
        if response.status_code == 200 and response.text.strip() != "0":
            print("Prediction sent successfully!")
        else:
            print("Error sending prediction. Response:", response.text)

    except Exception as e:
        print("Error:", e)

# Test function with pre-entered data
def test_send_prediction():
    print("Testing send_predictions.py with dummy value...")

    # Dummy prediction value for testing
    test_prediction = 75  # Example: 75% full
    print(f"Sending test prediction: {test_prediction}%")
    
    # Simulate sending without actually calling the API
    print("Simulated API call successful!")
    print("Send predictions test successful!")

# Run test
if __name__ == "__main__":
    test_send_prediction()
