# Playground

## Outline of topics in each R code Activity

### *Activity 2*
Extremely basic histogram code including a little bit on binwidth. Also how to make title, author, date, and subtitle items at the top.

### *Activity 3*
Histograms with color and fill.
``` R
ggplot(data=typical and aes(x=A)))
```

### *Activity 4* 
Histograms with color and fill as well as labels and scaling axes.
``` R
labs(x='Number of text messages sent and received per day') + scale_x_continuous(breaks=seq(0,400,25)) # X axis goes from 0 to 400 in intervals of 25
```
Finding and making lines for the mean and median of a dataset 
``` R
geom_vline(aes(xintercept=mean(tech_csv$number_text),color='red')) + geom_vline(aes(xintercept=median(tech_csv$number_text),color='blue')) # Define Intercept
```
Adding a categorical variable 
``` R
ggplot(data=tech_csv,aes(x=number_text, fill=preference)) + geom_histogram(binwidth=25, position='identity', alpha=0.5) # Key is position='identity' and fill=column. This STACKS the histograms
```
Versus splitting the graphs into separate rows for each category
``` R
facet_wrap(~preference, nrow=3) # nrow is number of rows
```

### *Activity 6*
Bar graphs and themes. Editing text size as well.
``` R
geom_bar() + theme(axis.text.x = element_text(size=6))
```
Scale axes to the number of categorical variables.
``` R
scale_x_discrete(limits=flevels)
```
Layering another categorical variable on top of the graph. Here the amount of each award won by each gender is shown
``` R
ggplot(data=poll_award_csv, aes(x=award, fill=sex)) + geom_bar() + labs(x='Favorite Award')
```
Scaling axes to an interval and showing proportions 
``` R
ggplot(data=poll_award_csv, aes(x=award, fill=sex)) + geom_bar(aes(y=(..count..)/sum(..count..))) + ylim(0,0.6) + labs(x='Favorite Award', y='Proportion')
```
Instead of stacking them, put bars side by side
``` R
geom_bar(aes(y=(..count..)/sum(..count..)), color = 'black',position='dodge') # position='dodge'
```
Cleaning columns of NA values, you can use na.omit and remember to load the dplyr package.
``` R
filter(midus, !is.na(mhealth), !is.na(phealth)
```
