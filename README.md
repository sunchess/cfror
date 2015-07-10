# Custom Fields Ruby on Rails

Add custom fields functional to your Rails app!

## Installation

```ruby
  gem 'cfror'
  bundle
  rake db:migrate
```
And now you can put to the some model.

```ruby
 has_many :fields, as: :fieldable, class_name: Cfror::Field
```

Put to controller
```ruby
  def new
    @site = Site.new
  end
```


In view(real slim example)

```slim
   = form_for @site do |f|
      fieldset
        section 
          label.input
            = f.text_field :title
      .well.well-light.well-sm.no-margin.no-padding.mb20px
        .smart-form
          h3.padding-20 Поля 
          fieldset.padding-20 ng-repeat="field in fields" ng-hide="field._destroy" ng-init='pidx = $index'
            = f.fields_for :fields, Cfror::Field.new, child_index: '{{pidx}}'do |ef|
              = ef.hidden_field :id, 'ng-if'=>"field.id", 'value'=>'{{field.id}}'
              = ef.hidden_field :_destroy, 'ng-if'=>"field._destroy", 'value'=>'{{field._destroy}}'
              section.row.no-margin 
                .col-sm-6.col-md-4 style="padding-right: 20px"
                  = ef.label :title, class: 'label'
                  label.input
                    = ef.text_field :title, 'ng-model' => 'field.title'
              section.row.no-margin 
                .col-sm-6.col-md-4 style="padding-right: 20px"
                  = ef.label :name, class: 'label'
                  label.input
                    = ef.text_field :name, 'ng-model' => 'field.name'
              section.row.no-margin 
                .col-sm-6.col-md-4 style="padding-right: 20px"
                  = ef.label :field_type, class: 'label'
                  label.select
                    = ef.select :field_type, Cfror::Field.field_types.map{|k, v| [t("cfror.field_type.#{k}"), k]}, {}, {'ng-model' => 'field.field_type'}
                    i

              section.no-margin[ng-if="field.field_type == 'option'"]
                h3.padding-20 Options
                div ng-repeat="select_option in field.select_options = (field.select_options || [{}])" ng-hide="select_option._destroy" ng-init='cidx = $index'
                  = ef.fields_for :select_options, Cfror::SelectOption.new, child_index: '{{cidx}}' do |df|
                    = df.hidden_field :id, 'ng-if'=>"select_option.id", 'value'=>'{{select_option.id}}'
                    = df.hidden_field :_destroy, 'ng-if'=>"select_option._destroy", 'value'=>'{{select_option._destroy}}'
                    .row.no-margin
                      .col-sm-5.col-md-4.pr20px
                        section
                          = df.label :body, class: 'label'
                          label.input
                            = df.text_field :body, 'ng-model' => 'select_option.body'
                      .col-sm-2.col-md-2 
                        label.label
                          | &nbsp;
                        a.btn.btn-danger.btn-plus.mr10px ng-show="$parent.field.select_options.length>1" ng-click="select_option._destroy = true" -
                a.btn.btn-success ng-show="$last" ng-click="$parent.field.select_options.push({})" Add

            a.btn.btn-danger.pull-right ng-show="fields.length>1" ng-click="field._destroy = true" Delete
          footer 
            a.btn.btn-success ng-click="fields.push({})" Add one


      = f.submit 
```
Cfror::Field has Integer, String, Text, Image, Date, Datetime and Set column types

## It is alfa version now!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
