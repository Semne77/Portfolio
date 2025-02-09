import json
import matplotlib.pyplot as plt
from collections import Counter

# Load the JSON data
file_path = "players_data.json"  # Ensure this file is in the same directory
with open(file_path, "r") as file:
    players_data = json.load(file)

# Extract ages from the data
ages = [player["Age"] for player in players_data]

# Count occurrences of each age
age_counts = Counter(ages)

# Sort age frequencies by age
sorted_ages = sorted(age_counts.items())  # Sorting by age
age_labels, age_frequencies = zip(*sorted_ages)

# Create the bar chart
plt.figure(figsize=(12, 6))
plt.bar(age_labels, age_frequencies, color='skyblue')
plt.xlabel("Age")
plt.ylabel("Frequency")
plt.title("Distribution of Tennis Players' Ages")
plt.xticks(age_labels)  # Ensure all age labels are displayed

# Show the chart
plt.show()