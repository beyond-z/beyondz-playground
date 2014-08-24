module HasUserForm
  extend ActiveSupport::Concern

  def process_applicant_type!(user)
    case user[:applicant_type]
    when 'other'
      user[:applicant_details] = params[:other_details]
    when 'professional'
      user[:applicant_details] = params[:professional_details]
    when 'grad_student'
      # Each of these has different names in the form to ensure no data
      # conflict as the user explores the bullets, but they all map to
      # the same database field since it is really the same data
      user[:anticipated_graduation] = params[:anticipated_grad_graduation]
    when 'undergrad_student'
      user[:anticipated_graduation] = params[:anticipated_undergrad_graduation]
    when 'school_student'
      user[:anticipated_graduation] = 'Grade ' + params[:grade]
    end
    user
  end

  def states
    @states = {
      'Alabama' => 'AL', 'Alaska' => 'AK', 'Arizona' => 'AZ',
      'Arkansas' => 'AR', 'California' => 'CA', 'Colorado' => 'CO',
      'Connecticut' => 'CT', 'Delaware' => 'DE', 'District of Columbia' => 'DC',
      'Florida' => 'FL', 'Georgia' => 'GA', 'Hawaii' => 'HI', 'Idaho' => 'ID',
      'Illinois' => 'IL', 'Indiana' => 'IN', 'Iowa' => 'IA', 'Kansas' => 'KS',
      'Kentucky' => 'KY', 'Louisiana' => 'LA', 'Maine' => 'ME', 'Maryland' => 'MD',
      'Massachusetts' => 'MA', 'Michigan' => 'MI', 'Minnesota' => 'MN',
      'Mississippi' => 'MS', 'Missouri' => 'MO', 'Montana' => 'MT',
      'Nebraska' => 'NE', 'Nevada' => 'NV', 'New Hampshire' => 'NH',
      'New Jersey' => 'NJ', 'New Mexico' => 'NM', 'New York' => 'NY',
      'North Carolina' => 'NC', 'North Dakota' => 'ND', 'Ohio' => 'OH',
      'Oklahoma' => 'OK', 'Oregon' => 'OR', 'Pennsylvania' => 'PA',
      'Rhode Island' => 'RI', 'South Carolina' => 'SC', 'South Dakota' => 'SD',
      'Tennessee' => 'TN', 'Texas' => 'TX', 'Utah' => 'UT', 'Vermont' => 'VT',
      'Virginia' => 'VA', 'Washington' => 'WA', 'West Virginia' => 'WV',
      'Wisconsin' => 'WI', 'Wyoming' => 'WY'
    }
  end
end