# Game Data Analysis with R Studio

This project explores and visualizes insights from a video game sales dataset using R Studio. By leveraging libraries like `dplyr`, `ggplot2`, and `tidyverse`, it uncovers trends and patterns in global sales, popular genres, publishers, platforms, and games over the years.

## Key Features and Workflow:

### 1. **Data Loading and Preprocessing**
- The dataset `vgsales.csv` is loaded using `read_csv()` and reviewed with functions like `glimpse()`, `head()`, and `summary()` to understand its structure.
- Identifies and handles missing values in the `Year` column.
- Ensures the dataset contains unique and non-duplicated entries using functions like `distinct()` and `filter()`.

### 2. **Exploratory Data Analysis (EDA)**
- **Global Sales Distribution**:
  - A histogram is created to visualize the distribution of global sales across all video games.
- **Top-Selling Games**:
  - Filters games with global sales exceeding 25 million and visualizes them using a scatter plot (`geom_point()`), showing sales trends by year and genre.
- **Most Popular Genres**:
  - Bar charts display sales trends across different genres, identifying which genres perform best globally.

### 3. **Publisher Analysis**
- Groups data by `Publisher` and identifies the top 10 publishers with the highest number of video games.
- A bar chart visualizes the count of games per publisher.

### 4. **Platform and Yearly Trends**
- Groups data by `Platform` and `Year` to determine the most popular platforms each year based on global sales.
- Visualized using a bar chart (`geom_bar()`), highlighting platforms with the highest sales annually.

### 5. **Most Popular Game Per Year**
- Filters the dataset to identify the highest-selling game for each year.
- Uses a combination of scatter plots and line segments (`geom_point()` and `geom_segment()`) to visualize annual trends in popular games and their sales.

### Technologies Used:
- **Programming Language**: R
- **Libraries**:
  - `dplyr` for data manipulation and filtering.
  - `ggplot2` for creating insightful visualizations.
  - `tidyverse` for streamlined data analysis workflows.
  - `lubridate` for handling date and time data.
  - `viridis` for aesthetic color palettes.
  - `scales` for improving axis readability.

## Insights Derived:
1. Identified top-selling games globally and their trends over time.
2. Highlighted genres that consistently perform well in global markets.
3. Analyzed the performance of publishers, platforms, and games over the years.
4. Provided actionable insights into sales patterns and the evolution of gaming trends.

This project demonstrates the use of R for data-driven decision-making in the gaming industry. It offers a foundation for deeper analysis, such as predictive modeling or detailed demographic studies.
