CREATE TABLE plans_plan (
  id CHAR(32) NOT NULL,
  name VARCHAR(50) NOT NULL,  description VARCHAR(255) NOT NULL,
  amount INT NOT NULL,
  start_date DATE DEFAULT NULL,
  last_charge_date DATE DEFAULT NULL,
  next_charge_date DATE DEFAULT NULL,
  created_on DATETIME NOT NULL,
  frequency_id INT NOT NULL,
  owner_id CHAR(32) NOT NULL,
  status_id INT NOT NULL,
  interest_rate DOUBLE NOT NULL,
  withdrawal_date DATE DEFAULT NULL,
  default_plan TINYINT(1) NOT NULL,
  plan_type_id INT NOT NULL,
  goal DOUBLE NOT NULL,
  locked TINYINT(1) NOT NULL,
  next_returns_date DATE NOT NULL,
  last_returns_date DATE NOT NULL,
  cowry_amount INT NOT NULL,
  debit_card CHAR(32) DEFAULT NULL,
  is_archived TINYINT(1) NOT NULL,
  is_deleted TINYINT(1) NOT NULL,
  is_goal_achieved TINYINT(1) NOT NULL,
  is_a_goal TINYINT(1) NOT NULL,
  is_interest_free TINYINT(1) NOT NULL,
  plan_group_id CHAR(32) DEFAULT NULL,
  is_deleted_from_group TINYINT(1) NOT NULL,
  is_a_fund TINYINT(1) NOT NULL,
  purchased_fund_id CHAR(32) DEFAULT NULL,
  is_a_wallet TINYINT(1) NOT NULL,
  currency_is_dollars TINYINT(1) NOT NULL,
  is_auto_rollover TINYINT(1) NOT NULL,
  is_vendor_plan TINYINT(1) NOT NULL,
  plan_source VARCHAR(100) NOT NULL,
  is_donation_plan TINYINT(1) NOT NULL,
  donation_description LONGTEXT NOT NULL,
  donation_expiry_date DATE DEFAULT NULL,
  donation_link VARCHAR(255) DEFAULT NULL,
  link_code VARCHAR(255) DEFAULT NULL,
  charge_payment_fee TINYINT(1) NOT NULL,
  donation_is_approved TINYINT(1) NOT NULL,
  is_emergency_plan TINYINT(1) NOT NULL,
  is_personal_challenge TINYINT(1) NOT NULL,
  currency_id INT NOT NULL,
  is_a_usd_index TINYINT(1) NOT NULL,
  usd_index_id CHAR(32) DEFAULT NULL,
  open_savings_plan TINYINT(1) NOT NULL,
  new_cycle TINYINT(1) NOT NULL,
  recurrence LONGTEXT,
  is_bloom_note TINYINT(1) NOT NULL,
  is_managed_portfolio TINYINT(1) NOT NULL,
  portfolio_holdings_id CHAR(32) DEFAULT NULL,
  is_fixed_investment TINYINT(1) NOT NULL,
  is_regular_savings TINYINT(1) NOT NULL,
  preset_id INT DEFAULT NULL,

  PRIMARY KEY (id),

  KEY plans_plan_frequency_id (frequency_id),
  KEY plans_plan_owner_id (owner_id),
  KEY plans_plan_status_id (status_id),
  KEY plans_plan_plan_type_id (plan_type_id),
  KEY plans_plan_plan_group_id (plan_group_id),
  KEY plans_plan_purchased_fund_id (purchased_fund_id),
  KEY plans_plan_usd_index_id (usd_index_id),
  KEY plans_plan_currency_id (currency_id),
  KEY plans_plan_portfolio_holdings_id (portfolio_holdings_id),
  KEY plans_plan_preset_id (preset_id),

  CONSTRAINT fk_currency_id FOREIGN KEY (currency_id) REFERENCES plans_currency (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_portfolio_holdings_id FOREIGN KEY (portfolio_holdings_id) REFERENCES managed_portfolio_portfolioholdings (id),
  CONSTRAINT fk_preset_id FOREIGN KEY (preset_id) REFERENCES plans_planpreset (id),
  CONSTRAINT fk_usd_index_id FOREIGN KEY (usd_index_id) REFERENCES funds_usdindex (id) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE plans_plan (
  id CHAR(32) NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  amount INT NOT NULL,
  start_date DATE NULL,
  last_charge_date DATE NULL,
  next_charge_date DATE NULL,
  created_on DATETIME NOT NULL,
  frequency_id INT NOT NULL,
  owner_id CHAR(32) NOT NULL,
  status_id INT NOT NULL,
  interest_rate FLOAT NOT NULL,
  withdrawal_date DATE NULL,
  default_plan BIT NOT NULL,
  plan_type_id INT NOT NULL,
  goal FLOAT NOT NULL,
  locked BIT NOT NULL,
  next_returns_date DATE NOT NULL,
  last_returns_date DATE NOT NULL,
  cowry_amount INT NOT NULL,
  debit_card CHAR(32) NULL,
  is_archived BIT NOT NULL,
  is_deleted BIT NOT NULL,
  is_goal_achieved BIT NOT NULL,
  is_a_goal BIT NOT NULL,
  is_interest_free BIT NOT NULL,
  plan_group_id CHAR(32) NULL,
  is_deleted_from_group BIT NOT NULL,
  is_a_fund BIT NOT NULL,
  purchased_fund_id CHAR(32) NULL,
  is_a_wallet BIT NOT NULL,
  currency_is_dollars BIT NOT NULL,
  is_auto_rollover BIT NOT NULL,
  is_vendor_plan BIT NOT NULL,
  plan_source VARCHAR(100) NOT NULL,
  is_donation_plan BIT NOT NULL,
  donation_description TEXT NOT NULL,
  donation_expiry_date DATE NULL,
  donation_link VARCHAR(255) NULL,
  link_code VARCHAR(255) NULL,
  charge_payment_fee BIT NOT NULL,
  donation_is_approved BIT NOT NULL,
  is_emergency_plan BIT NOT NULL,
  is_personal_challenge BIT NOT NULL,
  currency_id INT NOT NULL,
  is_a_usd_index BIT NOT NULL,
  usd_index_id CHAR(32) NULL,
  open_savings_plan BIT NOT NULL,
  new_cycle BIT NOT NULL,
  recurrence TEXT NULL,
  is_bloom_note BIT NOT NULL,
  is_managed_portfolio BIT NOT NULL,
  portfolio_holdings_id CHAR(32) NULL,
  is_fixed_investment BIT NOT NULL,
  is_regular_savings BIT NOT NULL,
  preset_id INT NULL
);

CREATE TABLE plans_currency (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE funds_usdindex (
    id CHAR(32) PRIMARY KEY,
    index_name VARCHAR(100) NOT NULL
);

CREATE TABLE managed_portfolio_portfolioholdings (
    id CHAR(32) PRIMARY KEY,
    description VARCHAR(255)
);
CREATE TABLE plans_planpreset (
    id INT PRIMARY KEY,
    preset_name VARCHAR(100)
);

-- Add Indexes
CREATE INDEX plans_plan_frequency_id ON plans_plan (frequency_id);
CREATE INDEX plans_plan_owner_id ON plans_plan (owner_id);
CREATE INDEX plans_plan_status_id ON plans_plan (status_id);
CREATE INDEX plans_plan_plan_type_id ON plans_plan (plan_type_id);
CREATE INDEX plans_plan_plan_group_id ON plans_plan (plan_group_id);
CREATE INDEX plans_plan_purchased_fund_id ON plans_plan (purchased_fund_id);
CREATE INDEX plans_plan_usd_index_id ON plans_plan (usd_index_id);
CREATE INDEX plans_plan_currency_id ON plans_plan (currency_id);
CREATE INDEX plans_plan_portfolio_holdings_id ON plans_plan (portfolio_holdings_id);
CREATE INDEX plans_plan_preset_id ON plans_plan (preset_id);

-- Add Foreign Key Constraints
ALTER TABLE plans_plan
ADD CONSTRAINT fk_currency_id FOREIGN KEY (currency_id)
REFERENCES plans_currency (id)

ALTER TABLE plans_plan
ADD CONSTRAINT fk_portfolio_holdings_id FOREIGN KEY (portfolio_holdings_id)
REFERENCES managed_portfolio_portfolioholdings (id);

ALTER TABLE plans_plan
ADD CONSTRAINT fk_preset_id FOREIGN KEY (preset_id)
REFERENCES plans_planpreset (id);

ALTER TABLE plans_plan
ADD CONSTRAINT fk_usd_index_id FOREIGN KEY (usd_index_id)
REFERENCES funds_usdindex (id)
