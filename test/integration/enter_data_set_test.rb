require 'test_helper'

class EnterDataSetTest < ActionDispatch::IntegrationTest
  include CapyHelper

  setup do
    Capybara.current_driver = Capybara.javascript_driver
    Capybara.default_wait_time = 15
  end

  teardown do
    finish
  end

  test "enter a data set" do
    login('kate', '12345')
    click_on 'Projects'
    click_on 'Measuring Things'
    find('#fields').click_on 'Edit'
    find('#fields').click_on 'Add Field'
    find('#fields').click_on 'Number'
    find('#fields').click_on 'Add Field'
    find('#fields').click_on 'Number'
    click_on 'Manual Entry'
    find('#manualTable').all('.input-small')[0].native.send_keys "5"
    find('#manualTable').all('.input-small')[1].native.send_keys "6"
    click_on "Add Row"
    find('#manualTable').all('.input-small')[2].native.send_keys "22"
    find('#manualTable').all('.input-small')[3].native.send_keys "1"
    click_on 'Save'
    click_on 'Measuring Things'
    find('#dataset_list').click_on 'Visualize'

    assert page.has_content?('Number_2'), "Has new field"
    assert page.has_content?('Histogram'), "On the Viz page"
  end

  test "upload a CSV file" do
    login('kate', '12345')

    click_on "Projects"
    click_on "Dessert is Delicious"

    csv_path = Rails.root.join('test', 'CSVs', 'dessert.csv')

    page.execute_script %Q{$('#csv_file_form').parent().show()}
    find("#csv_file_form").attach_file("csv", csv_path)
    page.execute_script %Q{$('#csv_file_form').submit()}
  end

end
