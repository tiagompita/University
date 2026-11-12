#!/usr/bin/env python3
from pydbus import SystemBus
from gi.repository import GLib
import dbus
import dbus.exceptions
import dbus.service
import dbus.mainloop.glib
import sys

BLUEZ_SERVICE_NAME = 'org.bluez'
GATT_MANAGER_IFACE = 'org.bluez.GattManager1'
LE_ADVERTISING_MANAGER_IFACE = 'org.bluez.LEAdvertisingManager1'
GATT_SERVICE_IFACE = 'org.bluez.GattService1'
GATT_CHARACTERISTIC_IFACE = 'org.bluez.GattCharacteristic1'
GATT_DESC_IFACE =    'org.bluez.GattDescriptor1'

DBUS_PROP_IFACE = 'org.freedesktop.DBus.Properties'
DBUS_OM_IFACE = 'org.freedesktop.DBus.ObjectManager'

# UUIDs for our custom Chat Service and Characteristic
CHAT_SERVICE_UUID = '12345678-1234-5678-1234-56789abcdef0'
CHAT_MSG_UUID = '12345678-1234-5678-1234-56789abcdef1'

# Generic org.bluez.GattDescriptor1 interface implementation --------------------------------
# The Descriptor will have a path /desc + index (e.g. /desc0, /desc1, etc.)

class Descriptor( dbus.service.Object ):
    def __init__( self, bus, index, uuid, flags, characteristic ):
        self.path = characteristic.path + '/desc' + str(index)
        self.bus = bus
        self.uuid = uuid
        self.flags = flags
        self.chrc = characteristic
        dbus.service.Object.__init__( self, bus, self.path )

    def get_properties( self ):
        return {
                GATT_DESC_IFACE: {
                        'Characteristic': self.chrc.get_path(),
                        'UUID': self.uuid,
                        'Flags': self.flags,
                }
        }

    def get_path( self ):
        return dbus.ObjectPath( self.path )

    @dbus.service.method( DBUS_PROP_IFACE, in_signature='s', out_signature='a{sv}' )
    def GetAll( self, interface ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        if interface != GATT_DESC_IFACE:
            raise InvalidArgsException()

        return self.get_properties()[GATT_DESC_IFACE]

    @dbus.service.method( GATT_DESC_IFACE, in_signature='a{sv}', out_signature='ay' )
    def ReadValue( self, options ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        print ('Default ReadValue called, returning error')
        raise NotSupportedException()

    @dbus.service.method( GATT_DESC_IFACE, in_signature='aya{sv}' )
    def WriteValue( self, value, options ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        print( 'Default WriteValue called, returning error' )
        raise NotSupportedException()

# Generic org.bluez.GattCharacteristic1 interface implementation --------------------------------
# The Characteristic will have a path /car + index (e.g. /car0, /car1, etc.)

class Characteristic( dbus.service.Object ):
    def __init__( self, bus, index, uuid, flags, service ):
        self.path = service.path + '/char' + str(index)
        self.bus = bus
        self.uuid = uuid
        self.service = service
        self.flags = flags
        self.descriptors = []
        dbus.service.Object.__init__( self, bus, self.path )

    # Internal methods

    def get_properties( self ):
        return {
                GATT_CHARACTERISTIC_IFACE: {
                        'Service': self.service.get_path(),
                        'UUID': self.uuid,
                        'Flags': self.flags,
                        'Descriptors': dbus.Array( self.get_descriptor_paths(), signature='o' )
                }
        }

    def get_path( self ):
        return dbus.ObjectPath( self.path )

    def add_descriptor( self, descriptor ):
        self.descriptors.append( descriptor )

    def get_descriptor_paths( self ):
        result = []
        for desc in self.descriptors:
            result.append( desc.get_path() )
        return result

    def get_descriptors( self ):
        return self.descriptors

    # Default D-Bus methods 

    @dbus.service.method( DBUS_PROP_IFACE, in_signature='s', out_signature='a{sv}' )
    def GetAll( self, interface ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        if interface != GATT_CHARACTERISTIC_IFACE:
            raise InvalidArgsException()

        return self.get_properties()[GATT_CHARACTERISTIC_IFACE]

    @dbus.service.method( GATT_CHARACTERISTIC_IFACE, in_signature='a{sv}', out_signature='ay' )
    def ReadValue( self, options ):
        print('Default ReadValue called, returning error' )
        raise NotSupportedException()

    @dbus.service.method( GATT_CHARACTERISTIC_IFACE, in_signature='aya{sv}' )
    def WriteValue( self, value, options ):
        print('Default WriteValue called, returning error')
        raise NotSupportedException()

    @dbus.service.method( GATT_CHARACTERISTIC_IFACE )
    def StartNotify( self ):
        print('Default StartNotify called, returning error')
        raise NotSupportedException()

    @dbus.service.method( GATT_CHARACTERISTIC_IFACE )
    def StopNotify( self ):
        print('Default StopNotify called, returning error')
        raise NotSupportedException()

    @dbus.service.signal( DBUS_PROP_IFACE, signature='sa{sv}as' )
    def PropertiesChanged( self, interface, changed, invalidated):
        pass

# generic org.bluez.GattService1 interface implementation --------------------------------
# The Characteristic will have a path /car + index (e.g. /car0, /car1, etc.)

class Service( dbus.service.Object ):
    def __init__( self, bus, path, index, uuid, primary ):
        self.path = path + str(index)
        self.bus = bus
        self.uuid = uuid
        self.primary = primary
        self.characteristics = []
        dbus.service.Object.__init__( self, bus, self.path )

    def get_properties( self ):
        return {
                GATT_SERVICE_IFACE: {
                        'UUID': self.uuid,
                        'Primary': self.primary,
                        'Characteristics': dbus.Array( self.get_characteristic_paths(), signature='o' )
                }
        }

    def get_path( self ):
        return dbus.ObjectPath( self.path )

    def add_characteristic( self, characteristic ):
        self.characteristics.append( characteristic )

    def get_characteristic_paths( self ):
        result = []
        for chrc in self.characteristics:
            result.append( chrc.get_path() )
        return result

    def get_characteristics( self ):
        return self.characteristics

    @dbus.service.method( DBUS_PROP_IFACE, in_signature='s', out_signature='a{sv}' )
    def GetAll( self, interface ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        if interface != GATT_SERVICE_IFACE:
            raise InvalidArgsException()

        return self.get_properties()[GATT_SERVICE_IFACE]

# A simple characteristic that supports Write and Indicate

class ChatQueue( Characteristic ):

    def __init__( self, bus, index, service ):
        print( 'Create queue characteristic' )

        # The write property allows clients to write their messages
        # The notify property allows clients to receive the messages (possibly with message losses)

        Characteristic.__init__( self, bus, index, CHAT_MSG_UUID, ['write', 'notify'], service )

        self.value = [] # This is the chat server's message queue
        self.notifying = False
        self.subscribed_clients = set()

        print( 'Queue characteristic created' )

    # We redefine this method to provide the value in a different way

    def get_properties( self ):
        return {
            GATT_CHARACTERISTIC_IFACE: {
                'UUID': self.uuid,
                'Service': self.service.get_path(),
                'Flags': self.flags,
                'Value': dbus.Array(self.value[-1] if self.value else [], signature='y')
            }
        }

    # This method dumps the queue of messages to all clients that wait for notifications

    def broadcast_to_clients( self ):
        while self.notifying and self.value:
            try:
                msg_bytes = self.value.pop( 0 )
                self.PropertiesChanged(GATT_CHARACTERISTIC_IFACE, {'Value': dbus.Array(msg_bytes, signature='y')}, [] )
            except Exception as e:
                print( f'Exception {e} while broadcasting the message queue to all clients' )

    # Methods hooked on the D-Bus interface

    # Handle the WriteValue D-Bus function call
    # THis function is called each time a client sends a message

    def WriteValue( self, value, options, sender=None ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        # Value is an array of bytes
        msg_bytes = bytes(value)
        msg_str = msg_bytes.decode( "utf-8" )
        print( f"Received from client {sender}: {msg_str}" )

        # Append received message to the message queue
        self.value.append( msg_bytes )

        # Broadcast the messages' queue to all clients
        self.broadcast_to_clients()
        return []

    # Handle the StartNotify D-Bus function call
    # This method is called when at leat one client requests notifications

    def StartNotify( self, sender=None ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        if sender == None:
            return

        self.notifying = True
        print( f"Client {sender} subscribed for notifications" )
        self.subscribed_clients.add( sender )

    # Handle the StopNotify D-Bus function call
    # This method is called when no more clients request notifications

    def StopNotify( self, sender=None ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        if sender == None:
            return

        self.subscribed_clients.discard( sender )
        print( f"Client {sender} unsubscribed from notifications" )
        if not self.subscribed_clients:
            self.notifying = False

# GATT service implementing a chat room ------------------------------------------------------------------------

class ChatService( Service ):
    def __init__( self, bus, path, index ):
        print( "Create chat service" )

        # Important: call super() before adding child objects

        Service.__init__( self, bus, path, index, CHAT_SERVICE_UUID, True )

        # Add message queue as a Characteristic

        self.add_characteristic( ChatQueue( bus, 0, self) )
        print( "Chat service created" )

# Application for handling our chat service ------------------------------------------------------------------------

class Application( dbus.service.Object ):
    def __init__( self, bus ):
        print( "Create chat application" )

        self.path = '/'
        self.services = []
        dbus.service.Object.__init__( self, bus, self.path )

        # Add a service to our application 

        self.services.append( ChatService( bus, '/org/bluez/example/service', 0 ) )

        print( "Chat application created" )

    def get_path( self ):
        return dbus.ObjectPath( self.path )

    # Handle the GetManagedObjects D-Bus function call

    @dbus.service.method( DBUS_OM_IFACE, out_signature='a{oa{sa{sv}}}' )
    def GetManagedObjects( self ):
        print( f'D-Bus call: {sys._getframe(  ).f_code.co_name}' )

        response = {}

        for service in self.services:
            response[service.get_path()] = service.get_properties()
            chrcs = service.get_characteristics()
            for chrc in chrcs:
                response[chrc.get_path()] = chrc.get_properties()
                descs = chrc.get_descriptors()
                for desc in descs:
                    response[desc.get_path()] = desc.get_properties()

        print( response )
        return response

# Main server function

def main( argv ):
    global mainloop

    if len(argv) < 2:
        print( "Usage %s hci_interface"% (argv[0]) )
        return

    dbus.mainloop.glib.DBusGMainLoop( set_as_default=True )

    # Get an object that represents the D-Bus

    bus = dbus.SystemBus()

    # Get a GATT object for the provided hci interface 

    adapter_path = "/org/bluez/" + argv[1]
    adapter_obj = bus.get_object( BLUEZ_SERVICE_NAME, adapter_path )
    service_manager = dbus.Interface( adapter_obj, GATT_MANAGER_IFACE )

    # Initialize our aplication, that uses D-Bus

    app = Application( bus )

    # Initialise the mainloop for waiting for D-bus calls

    mainloop = GLib.MainLoop()

    # Register our application for the provided hci device

    print( "Registering GATT application ..." )
    service_manager.RegisterApplication( app.get_path(), {},
                                         reply_handler=lambda: print( "GATT chat application registered" ),
                                         error_handler=lambda e: print( f"GATT chat registration failed: {e}" ) )

    mainloop.run()

if __name__ == '__main__':
    main( sys.argv )
