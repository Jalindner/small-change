module SubmissionHelper

  def get_material_objects_list(material)

    sub_materials = MaterialObject.where(category: material).distinct
      sub_materials_list = []
      sub_materials.each_with_index do |sub_mat|
        sub_materials_list << sub_mat.subcategory
      end
      sub_materials_list

  end

end