import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Banking',
      home: WelcomeScreen(),
    );
  }
}

// Sample JSON data
const String jsonData = '''
{
  "accounts": [
    {
      "type": "Chequing",
      "account_number": "CHQ123456789",
      "balance": 2500.00
    },
    {
      "type": "Savings",
      "account_number": "SAV987654321",
      "balance": 5000.00
    }
  ],
  "transactions": {
    "Chequing": [
      {
        "date": "2024-04-14",
        "description": "Utility Bill Payment",
        "amount": -120.00
      },
      {
        "date": "2024-04-16",
        "description": "ATM Withdrawal",
        "amount": -75.00
      },
      {
        "date": "2024-04-17",
        "description": "Deposit",
        "amount": 100.00
      },
      {
        "date": "2024-04-18",
        "description": "Withdrawal",
        "amount": -50.00
      }
    ],
    "Savings": [
      {
        "date": "2024-04-12",
        "description": "Withdrawal",
        "amount": -300.00
      },
      {
        "date": "2024-04-15",
        "description": "Interest",
        "amount": 10.00
      },
      {
        "date": "2024-04-16",
        "description": "Deposit",
        "amount": 200.00
      },
      {
        "date": "2024-04-18",
        "description": "Transfer to Chequing",
        "amount": -500.00
      }
    ]
  }
}
''';

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String todayDate = DateTime.now().toLocal().toString().split(' ')[0];
    
    return Scaffold(
      appBar: AppBar(title: Text("SIMAR'S MOBILE BANKING SYSTEM WELCOMES YOU")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance, size: 100, color: Colors.blue),
            Text("Welcome to Mobile Banking", style: TextStyle(fontSize: 20)),
            Text("Today's Date: $todayDate"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountListScreen()));
              },
              child: Text("View Accounts"),
            ),
          ],
        ),
      ),
    );
  }
}

// Account List Screen
class AccountListScreen extends StatelessWidget {
  final Map<String, dynamic> data = jsonDecode(jsonData);
  
  @override
  Widget build(BuildContext context) {
    List accounts = data['accounts'];

    return Scaffold(
      appBar: AppBar(title: Text("Your Accounts")),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          var account = accounts[index];
          return Card(
            child: ListTile(
              title: Text("${account['type']} Account"),
              subtitle: Text("Account No: ${account['account_number']}\nBalance: \$${account['balance']}"),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionScreen(accountType: account['type'])),
                  );
                },
                child: Text("View Transactions"),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Transactions Screen
class TransactionScreen extends StatelessWidget {
  final String accountType;
  
  TransactionScreen({required this.accountType});
  
  final Map<String, dynamic> data = jsonDecode(jsonData);

  @override
  Widget build(BuildContext context) {
    List transactions = data['transactions'][accountType] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("$accountType Transactions")),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          var txn = transactions[index];
          return Card(
            child: ListTile(
              title: Text(txn['description']),
              subtitle: Text("Date: ${txn['date']}"),
              trailing: Text("\$${txn['amount']}", style: TextStyle(color: txn['amount'] < 0 ? Colors.red : Colors.green)),
            ),
          );
        },
      ),
    );
  }
}
