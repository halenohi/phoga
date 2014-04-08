module Phoga::ArticleFormHelper
  def setup_categorizations(article)
    Phoga::Category.all.each do |cat|
      exist = article.categorizations.select{ |categorization|
        categorization.category_id == cat.id
      }.any?
      article.categorizations.build({ category_id: cat.id }) unless exist
    end
    article
  end

  def setup_categorizations_attributes(article_params)
    attrs = article_params[:categorizations_attributes].dup.map{ |k, v| v }
    attrs = attrs.inject([]) { |res, attr|
      if attr[:apply].to_i == 0
        res.push({ id: attr[:id], _destroy: 1 }) if attr[:id].present?
      else
        res.push({ id: attr[:id], category_id: attr[:category_id] })
      end
      res
    }
    if attrs.blank? || attrs.select{ |attr| !attr.has_key?(:_destroy) }.blank?
      attrs.push({ category_id: 1 })
    end
    article_params[:categorizations_attributes] = attrs
    article_params
  end
end
