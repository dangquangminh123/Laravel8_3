<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Setting;
use App\Models\Contact;

class ContactComponent extends Component
{

    public $name;
    public $email;
    public $phone;
    public $comment;

    public function updated($fields) {
        $this->validateOnly($fields, [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'comment' => 'required',
        ]);
    }   
// Khi ở user nhập thông tin cho ô map thì dán phần này vào https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62708.12827864176!2d106.59238472545204!3d10.791539846423355!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bf733e69175%3A0xd8d63453733325fe!2zVMOibiBQaMO6LCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1668775042088!5m2!1svi!2s
    public function sendMessage() {
        $this->validate([
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'comment' => 'required',
        ]);

        $contact = new Contact();
        $contact->name = $this->name;
        $contact->email = $this->email;
        $contact->phone = $this->phone;
        $contact->comment = $this->comment;
        $contact->save();
        session()->flash('message','Thanks, Your message has been sent successfully!');
    }
    
    public function render()
    {
        $setting = Setting::find(1);
        return view('livewire.contact-component',['setting'=>$setting])->layout('layouts.base');
    }
}
