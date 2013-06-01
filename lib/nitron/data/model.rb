module Nitron
  class Model < NSManagedObject
    include Data::Model::CoreData
    include Data::Model::FinderMethods
    include Data::Model::Persistence
    include Data::Model::Validations

    def inspect
      properties = []
      entity.properties.select { |p| p.is_a?(NSAttributeDescription) }.each do |property|
        properties << "#{property.name}: #{valueForKey(property.name).inspect}"
      end

      "#<#{entity.name} #{properties.join(", ")}>"
    end

  end
end