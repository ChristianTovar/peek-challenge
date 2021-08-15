# Peek GraphQL back-end API take-home challenge

## Description

For more information visit the [description](https://gist.github.com/thonydam/3010cb99a8925f7206459db42c776718) of this coding exercise.

## Installation

In order to start using the application, you must:

* Install dependencies with `mix deps.get`

* Create, migrate and seed your database with `mix ecto.setup`.


## Usage

It is pretty simple, just run `mix phx.server` and visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) from your browser. From there, you can start interacting with the api using any of the following query/mutations:

### List Orders

```
{
  listOrders {
    id
    description
    total
    balanceDue
  }
}
```

### Create Order

You can add as many payments as you want, as long as the total of those payments is equal or lower than the total of the order, otherwise this mutation will fail due to its atomicity:
```
mutation{
  createOrder(total: 10, description: "description", payments: [{amount: 7.6}, {amount: 1}]) {
    id
    total
    balanceDue
    description
  }
}
```

### Add Payments to Existing Order

Simply add the order id of the existing order with any amount you want to add, as long as you dont exceed the balance due of the order, it will add the new apyment:
```
mutation{
  addPaymentToOrder(orderId: ORDER_ID, amount: 11) {
    id
  }
}
```
