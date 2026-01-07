import requests
from bs4 import BeautifulSoup

def get_macbook_air_products():
    """Fetch and return MacBook Air refurbished products from Apple HK."""
    url = "https://www.apple.com/hk-zh/shop/refurbished/mac/macbook-air"
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"}
    
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    
    soup = BeautifulSoup(response.text, "html.parser")
    products = []
    
    # Find all li elements and extract MacBook Air products
    for item in soup.select("li"):
        title_element = item.select_one("h3 a")
        price_element = item.select_one("div.as-price-currentprice")
        
        if title_element and price_element:
            title = title_element.get_text(strip=True)
            price = price_element.get_text(strip=True)
            
            if "MacBook Air" in title and "HK$" in price:
                products.append({
                    "title": title,
                    "price": price
                })
    
    return products

def main():
    products = get_macbook_air_products()

    for i, product in enumerate(products, 1):
        print(f"--- {product['title']} - {product['price']}")
    print(f"Total: {len(products)} MacBook Air products found")



if __name__ == "__main__":
    main()
    
    
