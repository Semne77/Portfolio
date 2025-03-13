# 🎾 ATP Tennis Rankings Analysis  

## 📌 Project Overview  
This project is a **Python-based web scraper** that collects and analyzes **ATP tennis rankings data**.  
It scrapes player rankings from the **ATP Tour website**, extracts player details such as **rank, name, points, age, and nationality**, and saves the data in a JSON file. The data is then analyzed and visualized using `Matplotlib` to show **age distribution and nationality representation**.

📽 **Project Documentation:** [View Report](./ATP_Tennis_Rankings_Analysis.pdf)

---

## 📂 Project Structure  

The project consists of **three main Python scripts**:  

| File                   | Description |
|------------------------|-------------|
| `Main.py`             | **Scrapes ATP rankings** and stores player data in `players_data.json`. |
| `Age_Statistics.py`   | **Analyzes & visualizes player age distribution** using a bar chart. |
| `Countries_Statistics.py` | **Analyzes & visualizes top 8 nationalities** using a pie chart. |

---

## 🛠 Dependencies  

To run this project, install the required libraries:  

```bash
pip install requests beautifulsoup4 matplotlib
