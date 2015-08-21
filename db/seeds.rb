Client.create!([
  {active: true, last_edited_by: 1, clientname: "Bon Secours"},
  {active: false, last_edited_by: 1, clientname: "Jackson"},
  {active: true, last_edited_by: 1, clientname: "Rush"}
])
ImplStatus.create!([
  {active: true, last_edited_by: 1, status_name: "1. Active"},
  {active: true, last_edited_by: 1, status_name: "2. Complete"},
  {active: true, last_edited_by: nil, status_name: "3. Training"}
])
SalesRep.create!([
  {active: true, last_edited_by: 1, name: "Rich Lucas"},
  {active: true, last_edited_by: 1, name: "Jennifer Vanden Bergh"}
])
