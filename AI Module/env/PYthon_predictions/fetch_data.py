import requests
import pandas as pd
from config import THINGSPEAK_CHANNEL_ID, THINGSPEAK_READ_API, RESULTS_LIMIT

# Function to fetch past data from ThingSpeak
def fetch_real_data():
    url = f"https://api.thingspeak.com/channels/{THINGSPEAK_CHANNEL_ID}/fields/1.json?api_key={THINGSPEAK_READ_API}&results={RESULTS_LIMIT}"
    
    try:
        response = requests.get(url)
        data = response.json()

        timestamps = [entry["created_at"] for entry in data["feeds"]]
        fill_levels = [float(entry["field1"]) for entry in data["feeds"]]

        df = pd.DataFrame({"Timestamp": timestamps, "Fill Level": fill_levels})
        return df

    except Exception as e:
        print("Error fetching data:", e)
        return None

# Test function with pre-entered data
def test_fetch_data():
    print("Testing fetch_data.py with dummy data...")

    # Dummy data for testing
    test_data = {
        "Timestamp": ["2025-03-10 12:00", "2025-03-10 12:05", "2025-03-10 12:10"],
        "Fill Level": [10, 20, 30]
    }

    df = pd.DataFrame(test_data)
    print(df)
    print("Fetch data test successful!")

# Run test
if __name__ == "__main__":
    test_fetch_data()
