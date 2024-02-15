class Striper
    attr_accessor :name, :sph, :shift, :avalibility, :scheduled_hours
    def initialize (associate_name, associate_sph)
        @associate_name = associate_name
        @associate_sph = associate_sph
        @associate_max_hours = 20
    end
end