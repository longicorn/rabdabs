module Rabdabs
  class Document
    def self.generate
      spec_results = Middleware.class_variable_get(:@@spec_results)

      example = spec_results.first[:example]
      rspec_location = example.location.split(':')[0]

      document_path = "docs/rabdabs/#{rspec_location}.md"
      `mkdir -p #{document_path.split('/')[0..-2].join('/')}`

      File.open(document_path, 'w') do |f|
        f.write("# #{rspec_location}\n")

        spec_results.each do |spec_result|
          docs = []

          example = spec_result[:example]
          response = spec_result[:response]

          examples = [example]
          examples += example.example_group.parent_groups
          description = examples.reverse[1..-1].map(&:description).join('/')
          docs << "## #{description}"
          docs << "### response"

          docs << "#### method"
          docs << "#{response.request.method}"

          docs << "#### path"
          docs << "#{response.request.path}"

          docs << "#### status"
          docs << "#{response.status}"

          docs << "#### body"
          docs << "<details><summary>response.body</summary>"
          docs << ""
          docs << "```html"
          docs << response.body
          docs << "```"

          docs << "</details>"
          f.write(docs.join("\n"))
          f.write("\n\n")
        end
      end
    end
  end
end
