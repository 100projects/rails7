class User < ApplicationRecord
    validates :password,confirmation:true, presence: true ,length: { minimum: 5 }
    validates :terms, :acceptance => true
    validates :email , presence: true , uniqueness: true 


    def terms
        @terms
    end

    def terms=(raw)
        @terms = raw == 'on'? '1' : '0;'
    end

    def password
        @password
      end
    
    def password=(raw)
        @password = raw
        self.password_digest = BCrypt::Password.create(raw)
    end
    
    def is_password?(raw)
        BCrypt::Password.new(password_digest).is_password?(raw)
    end

end
