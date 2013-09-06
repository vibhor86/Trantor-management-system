module Admin::UsersHelper
  
  def user_name_column(record, column)
    truncate(record.name, :length => 25) 
  end
  
  def user_manager_id_column(record, column)
    record.manager ? record.manager.name : '-'
  end
  
  def user_band_id_column(record, column)
    record.band ? record.band.name : '-'
  end
  
  def user_designation_id_column(record, column)
    record.designation ? record.designation.name : '-'
  end
  
  def user_bank_id_column(record, column)
    record.bank ? record.bank.name : '-'
  end
  
  def user_emp_type_id_column(record, column)
    record.emp_type.present? ? record.emp_type.title : '-'
  end
  
  def user_confirmation_sent_at_column(record, column)
    format_date(record.confirmation_sent_at)
  end
  
  def user_manager_id_form_column(record, options)
    select :record, :manager_id, options_for_manager_select
  end
  
  def user_band_id_form_column(record, column)
    select :record, :band_id, options_for_band_select
  end
  
  def user_designation_id_form_column(record, column)
    select :record, :designation_id, options_for_designation_select
  end
  
  def user_bank_id_form_column(record, options)
    select :record, :bank_id, options_for_bank_select
  end
  
  def user_emp_type_id_form_column(record, options)
    select :record, :emp_type_id, options_for_emp_type_select
  end
  
  def user_gender_form_column(record, options)
    select :record, :gender, options_for_gender_select
  end
  
  def user_marital_status_form_column(record, options)
    select :record, :marital_status, options_for_marital_status_select
  end
  
  def user_blood_group_form_column(record, options)
    select :record, :blood_group, options_for_blood_group_select
  end
  
  def user_role_form_column(record, options)
    select :record, :role, options_for_role_select
  end
  
end