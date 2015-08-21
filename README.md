# Custom Fields for Ruby on Rails

Add custom fields functional to your Rails app!

## Installation

```ruby
  gem 'cfror'
```

```bash
  bundle
  rake db:migrate
```

And now you can put to a model include Cfror::Fields.

```ruby
  class Site < ActiveRecord::Base
    include Cfror::Fields
  end
```

Put to a controller
```ruby
  def new
    @site = Site.new
    gon.fields = @site.fields #see the gon gem
  end

  def edit
    @site = Site.find(params[:id])
    gon.fields = @site.fields
  end
```


And in view (real slim and angular example)

```slim
   = form_for @site do |f|
      fieldset
        section
          label.input
            = f.text_field :title
      .well.well-light.well-sm.no-margin.no-padding.mb20px
        .smart-form
          h3.padding-20 Fields
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

### Create and update are regular

Controller

```ruby

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Created!' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        @site.save_groups(params[:children])
        format.html { redirect_to @site, notice: 'Updated!' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end
```

### Add content

In your content model put include Cfror::Data

```ruby
class Publication < ActiveRecord::Base
  include Cfror::Data

  belongs_to :site
end
```

In form view

```slim
  = form_for @publication, html: {class: 'smart-form'} do |f|
    = f.hidden_field :site_id

    - @site.fields.order(:id).each do |field|
        fieldset
          section
            = render partial: 'layouts/cfror/field', locals:{field: field, model: @publication}

```
Partial layouts/cfror/field contains fields generator. Feel free to change it.

```erb

  <label>
    <%= field.title %>
    <br/>
    <%- case field.field_type
       when 'integer' %>
         <input type="number" name="cfror_fields[<%= field.id %>]" value="<%= field.integers.find_by(dataable: model).try(:body) %>" id="cfror_fields_<%=field.id%>" class="cfror_number_input"/>
      <%- when 'string' %>
         <input type="text" name="cfror_fields[<%= field.id %>]" value="<%= field.strings.find_by(dataable: model).try(:body) %>" id="cfror_fields_<%=field.id%>" class="cfror_text_input"/>
      <%- when 'boolean' %>
         <input type="checkbox" name="cfror_fields[<%= field.id %>]" value="<%= field.booleans.find_by(dataable: model).try(:body) %>" id="cfror_fields_<%=field.id%>" class="cfror_checkbox_input"/>
      <%- when 'text' %>
         <textarea name="cfror_fields[<%= field.id %>]" class="cfror_textarea" id="cfror_fields_<%=field.id%>"><%= field.texts.find_by(dataable: model).try(:body) %></textarea>
      <%- when 'date' %>
         <input type="date" name="cfror_fields[<%= field.id %>]" value="<%= field.dates.find_by(dataable: model).try(:body) %>" id="cfror_fields_<%=field.id%>" class="cfror_date_input"/>
      <%- when 'datetime' %>
         <input type="date" name="cfror_fields[<%= field.id %>]" value="<%= field.datetimes.find_by(dataable: model).try(:body) %>" id="cfror_fields_<%=field.id%>" class="cfror_datetime_input"/>
      <%- when 'image' %>
         <input type="file" name="cfror_fields[<%= field.id %>]" value="<%= field.images.find_by(dataable: model).try(:body) %>" id="cfror_fields_<%=field.id%>" class="cfror_file_input"/>
      <%- when 'option' %>
        <%-  value_option = field.options.find_by(dataable: model).try(:select_option_id) %>
        <select name="cfror_fields[<%= field.id %>" id="cfror_fields_<%=field.id%>" class="cfror_select">
          <% field.select_options.order(:id).each do |option|  %>
            <% if value_option and option.id.to_i == value_option.to_i %>
              <option value="<%= option.id %>" selected='selected'><%= option.body %></option>
            <% else %>
              <option value="<%= option.id %>"><%= option.body %></option>
            <% end %>
          <% end %>
        </select>
    <% end %>
  </label>
```

And create or update method you should add your_model.save_cfror_fields(params[:cfror_fields])

```ruby

 # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        @publication.save_cfror_fields(params[:cfror_fields])

        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        @publication.save_cfror_fields(params[:cfror_fields])

        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

```

### Show data

Show view

```ruby
  - @publication.value_fields_for(:site).each do |field|
    p
      = field.title
      br
      = field.value_object.body
      /or if you need to only values
      = field.value

```

value_fields_for method sets value_object on each object. The argument is a symbol of relation fields contains model.
I.e. there is belongs_to :site in Publication model.

### Images processing

If you want to have CarrierWave images processing you mast create app/uploaders/cfror/image_uploader.rb file and put CarrierWave code like below.

```ruby
# encoding: utf-8
class ImageUploader
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick


   # Create different versions of your uploaded files:
   version :thumb do
     process :resize_to_fit => [50, 50]
   end
end
```

The file is regular CarrierWave uploader.

## TODO

- Make a view jquery helper for rendering nested models
- Make fields helper by field types
- Tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
