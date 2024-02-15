class Day
    attr_accessor :max_hours, :max_openers, :max_closers, :date
    def initialize (associate_name, associate_sph)
        @associate_name = associate_name
        @associate_sph = associate_sph
    end
end