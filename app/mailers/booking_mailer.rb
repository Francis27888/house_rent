class BookingMailer < ApplicationMailer
    def booking_mail(renter,owner,house)
        @renter=renter
        @owner=owner
        @house=house
        mail to: @renter.email,message: '#{@renter.names} booked a house successfully!!!'
        mail to: @owner.email,message: '#{@renter.names} booked a house successfully!!!'
    end
end
