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

  def setup_tags_and_taggings_attributes(article_params, article)
    article_params[:taggings_attributes] ||= []
    updates = article_params.delete(:tag_names).split(',')
    currents = article.tag_names
    dels = currents - updates
    adds = updates - currents
    dels.each do |del|
      article_params[:taggings_attributes].push({
        id: article.taggings.select{ |tagging| tagging.tag.name == del }.first.id,
        _destroy: true
      })
    end
    adds.each_with_index do |add, i|
      tag = Phoga::Tag.find_by_name(add)
      if tag.present?
        adds.slice!(i)
        article_params[:taggings_attributes].push({
          tag_id: tag.id
        })
      end
    end
    article_params[:tags_attributes] = adds.map{ |add| { name: add } }
    article_params
  end
end
