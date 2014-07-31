# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :assignment_def1, class: AssignmentDefinition do
    id 1
    title 'Definition 1'
    led_by 'Someone'
    created_at DateTime.now
    updated_at DateTime.now
    start_date nil
    end_date nil
    front_page_info 'Front page info!'
    details_summary 'Some details about stuff'
    details_content 'More content'
    complete_module_url 'http://url.com'
    assignment_download_url 'http://url.com/download'
    eal_due_date DateTime.now
    final_message 'FINAL MESSAGE'
    seo_name 'SEO'
  end

  factory :assignment_def2, class: AssignmentDefinition do
    id 2
    title 'Definition 2'
    led_by 'Someone'
    created_at DateTime.now
    updated_at DateTime.now
    start_date nil
    end_date nil
    front_page_info 'Front page info!'
    details_summary 'Some details about stuff'
    details_content 'More content'
    complete_module_url 'http://url.com'
    assignment_download_url 'http://url.com/download'
    eal_due_date DateTime.now
    final_message 'FINAL MESSAGE'
    seo_name 'SEO'
  end


end
