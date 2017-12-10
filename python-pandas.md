# Pandas

https://pandas.pydata.org/pandas-docs/stable/10min.html

* Lots of methods can be chained.
* Tidy data complements vectorised operations

## Summarising data

Quick statistics of the CSV

  df.describe()

You can also perform a set of operations on columns, sum, count, max, min, median, std, var, mean.

.apply allows you to apply a function to each value

df.plot.hist() allows you to show a histogram or df.plot.scatter(x='w',y='h')

## Grouping

You can group by specific columns

  df.groupby(by='col')

or do an .agg() group by using a funcntionn rank, cummax etc... also

## Subset Observations (Rows)

Head and tail:

  df.head() and df.tail() 
  
Sample

  df.sample(n=2)
  
Get columnn 'Country' by name

  df['Country']
  df.Country
  
Get row 1 of the frame

  df.iloc[1] - df[1]
  
Get 'location' rows 1:2 and specific columns within those OR df.iloc[3:5,0:2]

  df.loc[1:2,['Key','Continent']]
  
Make a copy

  df2 = df.copy()

Setting a value:

  df.iat[0,1] = 0
  
## Subset Variables (Columns)

Get column as a specific type:

  df.Country.astype('str')
  
Get the Key and Country columns, only whenn the length of country > 10 (boolean expression)

  df.loc[df.Country.astype('str').str.len() > 10, ['Key', 'Country']]

Select by a regexp

  df.filter(regex='^StartingWith')
  
## Missing Data

Basic - https://pandas.pydata.org/pandas-docs/stable/missing_data.html#missing-data

Advanced - https://pandas.pydata.org/pandas-docs/stable/cookbook.html#cookbook-missing-data

Fill missing data with a specific value:

  df.fillna(value='boobear')

## Reshaping

Convert columns into rows

  pd.melt(df

Sort by a specific column

  df.sort_index(axis=1, ascending=False)
  
Order rows by the value by a specific column

  df.sort_values(by='B')

Rows into columns

  pd.pivot(columns='var', values='val')

Also can concatenate columnns or rows

Drop specific columns

  df.drop(['Length', 'Width'], axis=1)
  
## Combining Datasets

You can perfom set like operations over data-sets also.  merge() performs this

Filter with 

  .adf[adf.x.is.in(bdf.x)]
  
cvfgbhnjmklc  

## Processing Data

Iterate over rows in a dataframe:

  for index, row in chunk.iterrows():
  
Iterate over columnns in a specific row:

  for label, value in row.iteritems():
  
Convert row to a string:

  row.to_string(header=False, index=False)
 
## Dumping to CSV's

### Data Frames
You can dump a data-frame to a CSV file or to a StringIO buffer.  

You can specify quoting in terms of level and the quote characters.

  output = df.to_csv(output,
                     quoting=2,
                     quotechar="'",
                     header=False,
                     index=False)

### Rows/Series
When you get to the row level you can only control limited parts, due to dealing with Series instead of a DataFrame

You can call to_string on the series:

  buf = io.StringIO
  row.to_string(buf, index=False, header=False)

Exclude the header and index rows

  output = row.to_csv(header=False, index=False)
  
Process a dataframe, row by row, outputting type safe values:

  for index, row in chunk.iterrows():
    for label, value in row.iteritems():

      print value
      print type(value)
