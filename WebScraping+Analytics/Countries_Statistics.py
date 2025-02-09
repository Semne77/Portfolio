import json
import matplotlib.pyplot as plt
from collections import Counter

# Load the JSON data
file_path = "players_data.json"  # Ensure this file is in the same directory as this script
with open(file_path, "r") as file:
    players_data = json.load(file)

#print(players_data)
# Extract nationalities
nationalities = [player["Nationality"] for player in players_data]
print(nationalities)

# Count occurrences of each nationality
nation_counts = Counter(nationalities)

top_8 = nation_counts.most_common(8)  # Returns a list of tuples [(country, count), ...]

print(nation_counts)
print(top_8)
print(type(nation_counts))
print(type(top_8))
# Prepare data for the pie chart
labels, sizes = zip(*top_8)  # Unpacking into two lists

# Create the pie chart
plt.figure(figsize=(10, 6))
plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=140)
plt.title("Top 8 Nationalities in Tennis Rankings")
plt.axis('equal')  # Ensures the pie is a circle

# Show the chart
plt.show()