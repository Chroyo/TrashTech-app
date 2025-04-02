# config.py

# ThingSpeak Channel Info (Replace with actual values when ready)
THINGSPEAK_CHANNEL_ID = "YOUR_CHANNEL_ID"
THINGSPEAK_READ_API = "YOUR_READ_API_KEY"
THINGSPEAK_WRITE_API = "YOUR_WRITE_API_KEY"

# Number of past results to fetch from ThingSpeak
RESULTS_LIMIT = 10

# Function to test config values
def test_config():
    print("Testing config values...")
    print(f"Channel ID: {THINGSPEAK_CHANNEL_ID}")
    print(f"Read API Key: {THINGSPEAK_READ_API}")
    print(f"Write API Key: {THINGSPEAK_WRITE_API}")
    print("Config test successful!")

# Run test
if __name__ == "__main__":
    test_config()
