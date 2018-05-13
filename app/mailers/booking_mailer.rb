class BookingMailer < ApplicationMailer
    def booking_mail_renter(renter,owner,house)
        @renter=renter
        @owner=owner
        @house=house
        mail to: @renter.email,message: '#{@renter.names} booked a house successfully!!!'
    end
    def booking_mail_owner(renter,owner,house)
        @renter=renter
        @owner=owner
        @house=house
        mail to: @owner.email,message: '#{@renter.names} booked a house successfully!!!'
    end
end
