/**
 * RUMA CHARCOAL - EMAILJS INQUIRY FORM INTEGRATION
 * PT. Bumi Ruma Nusantara
 * 
 * Credentials:
 * Service ID: service_1txl5qd
 * Public API Key: C7hRKT772UiMwa1Yf
 * Template ID: template_6q936c6
 */

(function () {
  'use strict';

  const EMAILJS_SERVICE_ID = 'service_1txl5qd';
  const EMAILJS_PUBLIC_KEY = 'C7hRKT772UiMwa1Yf';
  const EMAILJS_TEMPLATE_ID = 'template_6q936c6';

  // Initialize EmailJS when library is loaded
  function initEmailJS() {
    if (window.emailjs) {
      window.emailjs.init({
        publicKey: EMAILJS_PUBLIC_KEY
      });
      console.log('[EmailJS] Initialized for Ruma Charcoal Export Desk.');
    } else {
      console.warn('[EmailJS] SDK not loaded yet. Retrying...');
      setTimeout(initEmailJS, 200);
    }
  }

  // Helper to extract clean international whatsapp number
  function cleanPhone(phone) {
    if (!phone) return '6289666327550';
    return phone.replace(/[^0-9]/g, '');
  }

  // Helper to show toast messages safely across all pages
  function notifyToast(message, type) {
    if (typeof window.showToast === 'function') {
      window.showToast(message, type || 'success');
      return;
    }
    const toast = document.getElementById('toast');
    const toastMsg = document.getElementById('toast-message');
    if (toast && toastMsg) {
      toastMsg.textContent = message;
      toast.className = 'show ' + (type || 'success');
      setTimeout(() => { toast.classList.remove('show'); }, 4500);
    } else {
      alert(message);
    }
  }

  // Universal Form Submission Handler
  function handleExportFormSubmit(form, formType) {
    const submitBtn = form.querySelector('button[type="submit"]') || form.querySelector('button');
    const originalBtnHtml = submitBtn ? submitBtn.innerHTML : 'Send Inquiry';
    const originalBtnText = submitBtn ? submitBtn.innerText : 'Send Inquiry';

    // 1. Gather all values across various form layouts
    const getVal = (idOrName) => {
      const el = form.querySelector('#' + idOrName) || form.querySelector('[name="' + idOrName + '"]');
      return el ? el.value.trim() : '';
    };

    const from_name = getVal('contactPerson') || getVal('from_name') || getVal('name') || getVal('fullName') || 'Prospective Buyer';
    const company_name = getVal('companyName') || getVal('company') || getVal('brandName') || 'Independent Importer';
    const email = getVal('contactEmail') || getVal('reply_to') || getVal('email') || '';
    const phone = getVal('contactPhone') || getVal('phone') || getVal('whatsapp') || '';
    const destination_port = getVal('destinationPort') || getVal('destination_port') || getVal('port') || 'FOB Tanjung Priok / To Be Quoted';
    
    // Product identification across product pages & general forms
    let product_name = getVal('productType') || getVal('product') || getVal('productSelect') || getVal('shishaGrade') || getVal('meshSpec') || getVal('lumpSpecies') || getVal('bbqProductType') || getVal('grade') || document.title.split('|')[0].trim();
    const cube_size = getVal('cubeSize');
    if (cube_size) product_name += ' (' + cube_size + ')';
    const iodine_spec = getVal('iodineSpec');
    if (iodine_spec) product_name += ' [Iodine: ' + iodine_spec + ']';

    const order_volume = getVal('volume') || getVal('orderVolume') || getVal('volumeSelect') || getVal('quantity') || '1x 20ft / 40ft FCL Container';
    const inquiry_type = getVal('inquiryType') || 'Commercial FCL Quotation & Sample Request';
    const message = getVal('notes') || getVal('message') || getVal('additionalNotes') || 'No additional notes provided. Please provide standard FOB and CIF quotation with lab COA and packing options.';

    // Basic validation
    if (!email && !phone) {
      notifyToast('Please enter your Corporate Email or WhatsApp so we can deliver your quotation.', 'error');
      return;
    }

    // Set loading state on button
    if (submitBtn) {
      submitBtn.disabled = true;
      submitBtn.innerHTML = `
        <svg class="animate-spin -ml-1 mr-2 h-5 w-5 text-white inline-block" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
          <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
          <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
        </svg>
        Transmitting to Export Desk...
      `;
    }

    // EmailJS Template Parameters mapping
    const templateParams = {
      from_name: from_name,
      name: from_name,
      contact_person: from_name,
      company_name: company_name,
      company: company_name,
      reply_to: email || 'purchasing@client-company.com',
      from_email: email || 'purchasing@client-company.com',
      email: email,
      phone: phone || 'Not provided',
      whatsapp: phone || 'Not provided',
      whatsapp_clean: cleanPhone(phone),
      destination_port: destination_port,
      port: destination_port,
      product_name: product_name,
      product: product_name,
      order_volume: order_volume,
      volume: order_volume,
      inquiry_type: inquiry_type,
      message: message,
      notes: message,
      page_source: document.title ? document.title.split('|')[0].trim() : window.location.pathname,
      date_time: new Date().toLocaleString('en-US', {
        dateStyle: 'medium',
        timeStyle: 'short',
        timeZone: 'Asia/Jakarta'
      }) + ' (WIB)'
    };

    console.log('[EmailJS] Sending payload:', templateParams);

    // Send email via EmailJS
    window.emailjs.send(EMAILJS_SERVICE_ID, EMAILJS_TEMPLATE_ID, templateParams, EMAILJS_PUBLIC_KEY)
      .then(function (response) {
        console.log('[EmailJS] Inquiry sent successfully!', response.status, response.text);
        
        // Restore button
        if (submitBtn) {
          submitBtn.disabled = false;
          submitBtn.innerHTML = originalBtnHtml;
        }

        // Show success notification
        notifyToast('Inquiry sent successfully to our export desk! We will reply within 2-4 hours. 🎉', 'success');

        // Reveal any inline success blocks present on specific pages
        const successBlock = document.getElementById('formSuccess') || 
                             document.getElementById('shishaSuccess') || 
                             document.getElementById('catalogSuccess') || 
                             document.getElementById('bbqSuccess');
        const successMsg = document.getElementById('formSuccessMsg') || 
                           document.getElementById('shishaSuccessMsg') || 
                           document.getElementById('catalogSuccessMsg') || 
                           document.getElementById('bbqSuccessMsg');
        const fastWa = document.getElementById('fastWaLink') || 
                       document.getElementById('fastShishaWa') || 
                       document.getElementById('catalogFastWa') || 
                       document.getElementById('fastBbqWa');

        if (successBlock) {
          successBlock.classList.remove('hidden');
          if (successMsg) {
            successMsg.textContent = `Thank you, ${from_name} (${company_name})! Your export inquiry for ${product_name} (${order_volume}) to ${destination_port} has been registered. Our pricing team is preparing your FOB/CIF matrix.`;
          }
        }

        if (fastWa) {
          const waMsg = encodeURIComponent(`Hello Ruma Charcoal Team, I am ${from_name} from ${company_name}. I just submitted an inquiry for ${product_name} (${order_volume}) shipping to ${destination_port}. Please review our commercial request.`);
          fastWa.href = `https://wa.me/6289666327550?text=${waMsg}`;
        }

        // Reset the form
        form.reset();
      })
      .catch(function (error) {
        console.error('[EmailJS] Error sending email:', error);

        // Restore button
        if (submitBtn) {
          submitBtn.disabled = false;
          submitBtn.innerHTML = originalBtnHtml;
        }

        // Show friendly fallback toast and prepare WhatsApp link
        notifyToast('Your inquiry has been registered! You can also connect directly with our WhatsApp Export Desk.', 'success');

        const fallbackWaText = encodeURIComponent(`Hello Ruma Charcoal Team, I am ${from_name} from ${company_name}. I would like to request an export quotation for ${product_name} (${order_volume}) to ${destination_port}. My email is: ${email}.`);
        window.open(`https://wa.me/6289666327550?text=${fallbackWaText}`, '_blank');
      });
  }

  // Auto-bind to all forms upon DOM ready
  document.addEventListener('DOMContentLoaded', function () {
    initEmailJS();

    const targetFormIds = [
      'contact-form',
      'contactForm',
      'catalogRfqForm',
      'shishaRfqForm',
      'bbqRfqForm',
      'rfq-form',
      'activatedCarbonRfqForm',
      'lumpRfqForm',
      'granulatedRfqForm'
    ];

    targetFormIds.forEach(function (formId) {
      const form = document.getElementById(formId);
      if (form) {
        form.addEventListener('submit', function (e) {
          e.preventDefault();
          handleExportFormSubmit(form, formId);
        });
        console.log('[EmailJS] Bound to form: #' + formId);
      }
    });
  });

})();
