# README

## Run the program

```
ruby main.rb
```

Input the path to a json file with multiple orders, formatted as follows:

```
{
  "data": [
    {
      "items": [
        {
          "name": "book",
          "price": 12.49,
          "quantity": 2,
          "tax_exempt": true,
          "imported": false
        },
        ...
      ]
    },
    ...
  ]
}
```


## Program structure

### Services
The data file is processed by the `PurchaseProcessor` class, which parses the json and passes the data to the `ReceiptGenerator` class for each order.

The `ReceiptGenerator` class generates a receipt for each order, which is then printed to the console.

### Models
Each item of an order is represented as an instance of the `Item` class.

## Third party libraries

- `rspec` for testing
- `json` for parsing the input file
- `rubocop` for code style


## Specs

Challenge's requirements are tested in spec/receipt_generator_spec.rb, specifically:

- spec/services/receipt_generator_spec.rb:32
- spec/services/receipt_generator_spec.rb:70
- spec/services/receipt_generator_spec.rb:116

## Screenshot
![image](https://github.com/user-attachments/assets/f02cd66c-5638-4d61-9683-08eb6f012d1f)
