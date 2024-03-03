#Import library
library(ggplot2)

# Read your dataset from a CSV file
your_dataset <- read.csv("js.csv")
head(your_dataset)

# Set a custom color palette
colors <- rainbow(nrow(your_dataset))

# Create a pie chart using ggplot2
ggplot(your_dataset, aes(x = "", y = MarketCap, fill = factor(BankName))) +
  geom_bar(width = 0.5, stat = "identity") +
  coord_polar("y") +
  theme_minimal() +
  theme(axis.text = element_blank(), legend.position = "right") +
  scale_fill_manual(values = colors) +
  ggtitle("Bank share holder analysis") +
  geom_text(aes(label = paste0(round((MarketCap / sum(MarketCap)) * 100, 2), "%")), 
            position = position_stack(vjust = 0.5), size = 2.5) +
  labs(fill = "Bank Name")
