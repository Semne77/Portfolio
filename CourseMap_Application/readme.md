# Academic Program Analyzer  

## Authors  
Lars Yarkosky, Abby Gerstner, Semyon Tsyrenov  

## Description  
The **Academic Program Analyzer** is a Python application that allows users to manage and analyze an academic program's **courses and prerequisites** using a **graph-based approach**. The program features a **graphical user interface (GUI)** built with **Tkinter** and **NetworkX** to visualize and process course dependencies efficiently.  

## Features  
✔ **Add courses and specify prerequisites**  
✔ **Identify courses without prerequisites**  
✔ **Find courses with the most and least prerequisites**  
✔ **Check for circular dependencies** in course prerequisites  
✔ **User-friendly GUI** for input and visualization  

## How It Works  

### Core Components  

- **Graph Representation:**  
  - The program models courses as **nodes** and prerequisites as **directed edges** using `networkx.DiGraph()`.  
- **GUI Interface:**  
  - A `Tkinter` window allows users to enter courses, view dependencies, and analyze course relationships.  
- **Event-Driven Functions:**  
  - Buttons trigger specific analyses and display results in real time.  

### Main Functions  

- `add_course(course, prerequisites)`: Adds a course as a node and its prerequisites as directed edges.  
- `courses_without_prerequisites()`: Finds courses that do not have any prerequisites.  
- `courses_with_most_prerequisites()`: Identifies courses that require the most prerequisite courses.  
- `courses_with_least_prerequisites()`: Identifies courses that require the least prerequisite courses.  
- `has_circular_dependencies()`: Checks for **circular dependencies** in the course prerequisites.  

## How to Run the Program  

1. **Install Python** (if not already installed).  
2. **Install dependencies** using:  
   ```bash
   pip install networkx
