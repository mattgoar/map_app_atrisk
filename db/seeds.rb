User.create!([
  {email: "mattgoar@gmail.com", encrypted_password: "$2a$10$mfT/9plAmWPa6WdsW9vo2OSWPSwUwk.TaYjpbXKw3av41B10AEjI.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-08-21 21:04:32", last_sign_in_at: "2015-08-21 21:04:32", current_sign_in_ip: "::1", last_sign_in_ip: "::1", last_name: "Goar", first_name: "Matt", user_role_id: nil, user_password: nil}
])
Client.create!([
  {active: true, last_edited_by: 1, clientname: "Bon Secours"},
  {active: true, last_edited_by: 1, clientname: "Jackson"},
  {active: true, last_edited_by: 1, clientname: "Rush"},
  {active: true, last_edited_by: 1, clientname: "SUNY"},
  {active: true, last_edited_by: 1, clientname: "ABC Client"}
])
ImplStatus.create!([
  {active: true, last_edited_by: 1, status_name: "1. Active"},
  {active: true, last_edited_by: 1, status_name: "2. Complete"},
  {active: true, last_edited_by: 1, status_name: "3. Training"}
])
PaymentStatus.create!([
  {active: true, last_edited_by: 1, status_name: "1. Current"},
  {active: true, last_edited_by: 1, status_name: "2. 0 - 30 Days"},
  {active: true, last_edited_by: 1, status_name: "3. 31 - 60 Days"},
  {active: true, last_edited_by: 1, status_name: "4. 61 - 120 Days"},
  {active: true, last_edited_by: 1, status_name: "5. Over 120 Days"}
])
SalesRep.create!([
  {active: true, last_edited_by: 1, name: "Rich Lucas"},
  {active: true, last_edited_by: 1, name: "Jennifer Vanden Bergh"}
])
