class Person < ApplicationRecord
  enum document_type: { ci: 'CI', ruc: 'RUC', foreigner: 'EXTRANJERO' }, _prefix: true
  def document_type_t
    return 'CI' if document_type_ci?
    return 'RUC' if document_type_ruc?
    'Extranjero' if document_type_foreigner?
  end

  enum person_type: { natural: 'FISICA', legal: 'JURIDICA' }, _prefix: true
  def person_type_t
    return 'Física' if person_type_natural?
    'Jurídica' if person_type_legal?
  end

  def full_document
    "#{document_type_t} - #{document_number + (verifying_digit || '')}"
  end

end
