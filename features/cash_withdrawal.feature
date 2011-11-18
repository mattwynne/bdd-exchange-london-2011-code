Feature: Cash Withdrawal

  Scenario: Successfully withdrawal from an account in credit
    Given my account has a balance of $100
    When I withdraw $20
    Then $20 should be dispensed
    And the balance of my account should be $80
