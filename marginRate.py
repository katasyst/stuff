import pandas as pd
import requests
from bs4 import BeautifulSoup



pd.set_option('display.max_columns', None)
pd.set_option('display.max_colwidth', None)
pd.set_option('display.max_rows', 1100)
pd.set_option('display.expand_frame_repr', False)

target_url = 'https://www.interactivebrokers.com.hk/en/trading/margin-rates.php'

# 
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
}
response = requests.get(target_url, headers=headers)
response.encoding = 'utf-8'

# 
soup = BeautifulSoup(response.content, 'html.parser')

# 
tables = soup.find_all('table')

# 

# 
if tables:
    df = pd.read_html(str(tables[0]))[0]  # 
    df['Currency'] = df['Currency'].ffill()
    df = df[(df['Currency'] == 'CHF') | (df['Currency'] == 'JPY')]
    df = df.drop_duplicates(subset=['Currency'], keep='first')

    print(df)
