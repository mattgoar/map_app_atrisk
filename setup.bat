call rails generate starter:resource client active:boolean last_edited_by:integer clientname:string;
call rails generate starter:resource impl_status active:boolean last_edited_by:integer status_name:string;
call rails generate starter:resource client_information client_id:integer last_edited_by:integer last_contact_date:date exec_sponsor:string termination_notice:date payment_status_id:integer balance:integer reactivation_date:date expiration_date:date annual_fee:integer sales_rep_id:integer type:string;
call rails generate starter:resource data_status last_edited_by:integer months_late:integer db_type:integer month:integer year:integer client_id:integer;
call rails generate starter:resource client_onboarding_status last_edited_by:integer notes:text current_impl_status:integer certification_date:date kickoff_date:date client_id:integer;
call rails generate starter:resource sales_rep active:boolean last_edited_by:integer name:string;
call rails generate starter:resource payment_status active:boolean last_edited_by:integer status_name:string;
call rails generate starter:resource user_role role_description:text role_name:string;

